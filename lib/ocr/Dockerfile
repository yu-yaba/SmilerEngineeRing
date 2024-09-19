# Python OCRサービス用のDockerfile

FROM python:3.9-slim

# 作業ディレクトリを設定
WORKDIR /app

# 必要なライブラリをインストール
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# アプリケーションのソースコードをコピー
COPY . /app

# ポートを指定
EXPOSE 5000

# サービスを起動
CMD ["python", "ocr_service.py"]
