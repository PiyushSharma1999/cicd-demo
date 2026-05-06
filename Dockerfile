FROM python:3.12-slim

LABEL maintainer="test@gmail.com"
LABEL org.opencontainer.image.source="https://github.com/your-org/cicd-demo"

WORKDIR /app
COPY app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app/ .

RUN addgroup --system appgroup && adduser --system --ingroup appgroup appuser
USER appuser

EXPOSE 5001
HEALTHCHECK --interval=30s --timeout=5s CMD curl -f http://localhost:5001/health || exit 1
CMD ["python", "main.py"]