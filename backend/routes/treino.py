from fastapi import APIRouter

from models.treino import TreinoRequest, TreinoResponse

router = APIRouter()

_treino_store: list[dict] = []


@router.post("/", response_model=TreinoResponse, status_code=201)
def criar_treino(treino: TreinoRequest) -> TreinoResponse:
    novo_id = len(_treino_store) + 1
    registro = treino.model_dump()
    registro["id"] = novo_id
    _treino_store.append(registro)

    return TreinoResponse(
        **registro,
        mensagem=f"Treino '{treino.nome}' registrado com sucesso!",
    )


@router.get("/", response_model=list[TreinoResponse])
def listar_treinos() -> list[TreinoResponse]:
    return [
        TreinoResponse(**t, mensagem="ok")
        for t in _treino_store
    ]
