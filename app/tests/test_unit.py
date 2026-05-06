import pytest
from app.main import app

@pytest.fixture
def client():
    app.config["TESTING"] = True
    with app.test_client() as c:
        yield c

def test_health(client):
    r = client.get("/health")
    assert r.status_code == 200
    assert r.get_json()["healthy"] is True

def test_add(client):
    r = client.get("/add/3/4")
    assert r.get_json()["result"] == 7

def test_add_2(client):
    r = client.get("/add/3/5")
    assert r.get_json()["result"] == 8