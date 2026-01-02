# ---------- BUILD STAGE ----------
FROM python:3.11-slim AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --user -r requirements.txt

# ---------- RUNTIME STAGE ----------
FROM python:3.11-slim
WORKDIR /app

# Create non-root user
RUN useradd -m appuser

# Give appuser permission to /app
RUN chown -R appuser:appuser /app

USER appuser

# Copy installed packages
COPY --from=builder /root/.local /home/appuser/.local
ENV PATH=/home/appuser/.local/bin:$PATH

# Copy application & tests
COPY app.py test_app.py ./

EXPOSE 5000
CMD ["python", "app.py"]
