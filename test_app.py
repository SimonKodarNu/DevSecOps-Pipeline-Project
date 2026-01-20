import pytest
from app import app

# test-klient av app
@pytest.fixture
def client():
    app.config['TESTING'] = True
    with app.test_client() as client:
        yield client

# Själva testet
def test_homepage(client):
    """Testar att startsidan svarar med rätt text och status 200"""
    
    # 1. Gör ett anrop till roten '/'
    response = client.get('/')
    
    # 2. Kontrollera att vi får HTTP 200 OK (allt gick bra)
    assert response.status_code == 200
    
    # 3. Kontrollera att texten innehåller "NordTech AB"
    assert b"NordTech AB" in response.data