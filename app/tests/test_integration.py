import requests, os

BASE = os.getenv("APP_URL", "http://localhost:5001")

def test_health_endpoint():
    r = requests.get(f"{BASE}/health")
    assert r.status_code == 200
    assert r.json()["healthy"] is True

def test_add_endpoint():
    r = requests.get(f"{BASE}/add/10/20")
    assert r.json()["result"] == 30