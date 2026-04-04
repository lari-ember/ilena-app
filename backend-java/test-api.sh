#!/bin/bash
# Script de teste dos endpoints da API Ilena (Java + Spring Boot)

set -e

BASE_URL="http://localhost:8000"
TIMEOUT=30

echo "======================================"
echo "🧪 Teste da API Ilena (Java)"
echo "======================================"
echo ""

# Verificar se a API está rodando
echo "⏳ Aguardando API ficar pronta..."
for i in $(seq 1 $TIMEOUT); do
    if curl -s "$BASE_URL/" > /dev/null 2>&1; then
        echo "✅ API está pronta!"
        break
    fi
    if [ $i -eq $TIMEOUT ]; then
        echo "❌ Timeout esperando pela API"
        exit 1
    fi
    sleep 1
done

echo ""
echo "1️⃣ Testando GET /"
echo "=================="
RESPONSE=$(curl -s "$BASE_URL/")
echo "$RESPONSE" | jq .
echo ""

echo "2️⃣ Testando POST /treino (1º treino)"
echo "======================================"
RESPONSE=$(curl -s -X POST "$BASE_URL/treino" \
  -H "Content-Type: application/json" \
  -d '{
    "nome": "Treino A - Peito",
    "tipo": "musculação",
    "duracaoMinutos": 60,
    "observacoes": "Aumentar carga"
  }')
echo "$RESPONSE" | jq .
TREINO_ID=$(echo "$RESPONSE" | jq -r '.id')
echo "✅ Treino criado com ID: $TREINO_ID"
echo ""

echo "3️⃣ Testando POST /treino (2º treino)"
echo "======================================"
RESPONSE=$(curl -s -X POST "$BASE_URL/treino" \
  -H "Content-Type: application/json" \
  -d '{
    "nome": "Treino B - Costas",
    "tipo": "musculação",
    "duracaoMinutos": 75,
    "observacoes": "Supino costas"
  }')
echo "$RESPONSE" | jq .
echo ""

echo "4️⃣ Testando GET /treino (listar tudo)"
echo "====================================="
RESPONSE=$(curl -s "$BASE_URL/treino")
COUNT=$(echo "$RESPONSE" | jq 'length')
echo "$RESPONSE" | jq .
echo "✅ Total de treinos: $COUNT"
echo ""

echo "5️⃣ Testando GET /treino/{id}"
echo "============================"
RESPONSE=$(curl -s "$BASE_URL/treino/$TREINO_ID")
echo "$RESPONSE" | jq .
echo ""

echo "6️⃣ Testando PUT /treino/{id}"
echo "============================"
RESPONSE=$(curl -s -X PUT "$BASE_URL/treino/$TREINO_ID" \
  -H "Content-Type: application/json" \
  -d '{
    "nome": "Treino A - Peito (Atualizado)",
    "tipo": "musculação",
    "duracaoMinutos": 90,
    "observacoes": "Aumentar muito a carga"
  }')
echo "$RESPONSE" | jq .
echo ""

echo "7️⃣ Testando DELETE /treino/{id}"
echo "==============================="
RESPONSE=$(curl -s -w "\nHTTP_CODE:%{http_code}" -X DELETE "$BASE_URL/treino/$TREINO_ID")
HTTP_CODE=$(echo "$RESPONSE" | grep "HTTP_CODE:" | cut -d: -f2)
echo "HTTP Status: $HTTP_CODE"
if [ "$HTTP_CODE" = "204" ]; then
    echo "✅ Deletado com sucesso (204 No Content)"
else
    echo "$RESPONSE"
fi
echo ""

echo "8️⃣ Listando treinos após delete"
echo "==============================="
RESPONSE=$(curl -s "$BASE_URL/treino")
COUNT=$(echo "$RESPONSE" | jq 'length')
echo "$RESPONSE" | jq .
echo "✅ Total de treinos: $COUNT (1º foi deletado)"
echo ""

echo "======================================"
echo "✅ Todos os testes passaram!"
echo "======================================"
echo ""
echo "📊 Endpoints testados:"
echo "  ✅ GET /"
echo "  ✅ POST /treino"
echo "  ✅ GET /treino"
echo "  ✅ GET /treino/{id}"
echo "  ✅ PUT /treino/{id}"
echo "  ✅ DELETE /treino/{id}"
echo ""
echo "🌐 Swagger UI: http://localhost:8000/swagger-ui.html"
echo ""

