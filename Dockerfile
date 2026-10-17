FROM python:3.12-slim
WORKDIR /app
COPY app/ /app/
RUN echo "Building image for Akerke Tairabek" && python --version
EXPOSE 8080
CMD ["python", "app.py"]
