# Soil Health (Initial Implementation)

This is a starter implementation for a Soil Health backend API that can be expanded against your SRS.

## What is included

- FastAPI service scaffold.
- Soil sample domain models with validation.
- In-memory repository for quick prototyping.
- Endpoints to create/list/fetch soil samples.
- Basic tests.

## Run locally

```bash
python -m venv .venv
source .venv/bin/activate
pip install -e .[dev]
uvicorn soil_health.main:app --reload
```

## API endpoints

- `GET /health`
- `POST /samples`
- `GET /samples`
- `GET /samples/{sample_id}`

## Next suggested steps

- Replace in-memory store with PostgreSQL.
- Add user/farm management from SRS actors.
- Implement recommendation engine based on nutrient trends.
- Add auth and role-based access.
