"""
Exemplo de implementação do endpoint /chat/ no backend FastAPI.

Este arquivo deve ser criado em backend/routes/chat.py
e incluído em backend/main.py via include_router()
"""

from fastapi import APIRouter, HTTPException
from pydantic import BaseModel
from typing import Optional
from datetime import datetime
import logging

# Configure logging
logger = logging.getLogger(__name__)

# ============ MODELOS ============

class ChatRequest(BaseModel):
    """Request body para POST /chat/"""
    message: str


class ChatResponse(BaseModel):
    """Response body para POST /chat/"""
    message: str
    timestamp: Optional[datetime] = None


# ============ ROUTER ============

router = APIRouter(prefix="/chat", tags=["chat"])


@router.post("/")
async def send_chat_message(request: ChatRequest) -> ChatResponse:
    """
    Endpoint para processar mensagem de chat.

    Args:
        request: ChatRequest com a mensagem do usuário

    Returns:
        ChatResponse com a resposta do assistente

    Raises:
        HTTPException: Se a mensagem estiver vazia ou houver erro
    """
    # Validação
    if not request.message or not request.message.strip():
        logger.warning("Empty message received")
        raise HTTPException(status_code=400, detail="Message cannot be empty")

    message = request.message.strip()
    logger.info(f"Chat message received: {message[:50]}...")  # Log primeiros 50 chars

    try:
        # MOCK RESPONSE (substituir por chamada real à IA)
        response_text = f"[MOCK RESPONSE] You said: '{message}'. This is an automatic response from the AI assistant."

        response = ChatResponse(
            message=response_text,
            timestamp=None  # Você pode adicionar timestamp se desejar
        )

        logger.info(f"Chat response sent successfully")
        return response

    except Exception as e:
        logger.error(f"Error processing chat message: {str(e)}")
        raise HTTPException(status_code=500, detail="Internal server error")


@router.get("/health/")
async def chat_health() -> dict:
    """Health check para o serviço de chat."""
    return {"status": "healthy", "service": "chat"}


# ============ EXEMPLO DE FUNÇÃO DE IA (FUTURA) ============

async def get_ai_response(message: str) -> str:
    """
    Função placeholder para integração com IA real.

    Esta função será expandida na Milestone 3 para:
    - Chamar OpenAI API
    - Chamar Anthropic API
    - Gerenciar tokens e custos
    - Implementar rate limiting
    - Log de conversas

    Args:
        message: Mensagem do usuário

    Returns:
        Resposta da IA
    """
    # TODO: Implementar integração com OpenAI/Anthropic
    # Exemplo pseudocódigo:
    #
    # response = await openai.ChatCompletion.acreate(
    #     model="gpt-4",
    #     messages=[{"role": "user", "content": message}],
    #     temperature=0.7,
    #     max_tokens=500
    # )
    # return response.choices[0].message.content

    return f"AI Response to: {message}"

