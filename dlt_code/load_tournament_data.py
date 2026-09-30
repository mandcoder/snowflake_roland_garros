import dlt
from dlt.sources.helpers import requests
from dlt.sources.helpers.requests import Response


@dlt.resource(write_disposition="merge", primary_key="id")
def matches(season_id: int):

    url = f"https://api.sportsapi365.com/v1/tennis/atp/tournament/results/{season_id}"
    headers = {"X-Gravitee-Api-Key": dlt.secrets["sources.api_key"]}
    response: Response = requests.get(url, headers=headers)
    response.raise_for_status()

    payload = response.json()

    yield payload["data"]["singles"]

    print(payload["data"]["singles"][0])  # bara för att få ett test i terminalen


@dlt.transformer(write_disposition="merge", primary_key="match_id", data_from=matches)
def statistic(match_list: list):
    for match in match_list:
        url = f"https://api.sportsapi365.com/v1/tennis/atp/h2h/match-stats/{match['tournamentId']}/{match['player1Id']}/{match['player2Id']}"
        headers = {"X-Gravitee-Api-Key": dlt.secrets["sources.api_key"]}
        response: Response = requests.get(url, headers=headers)
        response.raise_for_status()

        statistic = response.json()
        yield {
            "match_id": match["id"],
            "player1Stats": statistic["data"]["player1Stats"],
            "player2Stats": statistic["data"]["player2Stats"],
        }


if __name__ == "__main__":

    pipeline = dlt.pipeline(
        "tennis", destination="snowflake", dataset_name="sportsapi365"
    )

    m = matches(20340)
    pipeline.run([m, m | statistic])
