from pydantic import BaseModel, Field


class TreinoRequest(BaseModel):
    nome: str = Field(..., description="Nome do treino", example="Treino A - Peito")
    tipo: str = Field(..., description="Tipo do treino", example="musculação")
    duracao_minutos: int = Field(..., gt=0, description="Duração em minutos", example=60)
    observacoes: str | None = Field(None, description="Observações opcionais", example="Aumentar carga")


class TreinoResponse(BaseModel):
    id: int
    nome: str
    tipo: str
    duracao_minutos: int
    observacoes: str | None
    mensagem: str
