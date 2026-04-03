from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from routes.treino import router as treino_router

app = FastAPI(
    title="Ilena App API",
    description="Backend da assistente pessoal Ilena",
    version="0.1.0",
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(treino_router, prefix="/treino", tags=["treino"])


@app.get("/")
def read_root():
    return {"status": "ok", "message": "Ilena API v0.1.0"}
