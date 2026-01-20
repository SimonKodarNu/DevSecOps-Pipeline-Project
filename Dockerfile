# Python-runtime som (slim för mindre storlek)
FROM python:3.9-slim

# Sätt arbetsmappen i containern
WORKDIR /app


COPY requirments.txt .

# Installera requirements
RUN pip install --no-cache-dir -r requirements.txt

# Kopiera resten
COPY . .

# Skapar en icke-root användare och byt till den
# Detta förhindrar att appen har fulla rättigheter i containern
RUN useradd -m nordtechuser
USER nordtechuser

# Exponera porten appen körs på
EXPOSE 5000

# Kommandot för att starta appen
CMD ["python", "app.py"]
