## 名刺管理サービス

### 概要
* フロントエンドは/publicディレクトリです。
  * バニラJavaScriptであるためnpmなどのパッケージ管理サービス、Dockerfileは用意していません。
  * ポートはバックエンドと同じhttp://localhost:3000/ です。
* OCRはlib/ocrディレクトリです。
  * ポートはhttp://localhost:5001/ にしています。

### セットアップ

#### .envファイルを作成
* 以下は例です。任意の値を設定してください
```env
DATABASE_HOST=db
DATABASE_USERNAME=your_db_username
DATABASE_PASSWORD=your_db_password
DATABASE_NAME=your_db_name
DATABASE_PORT=3306
SERVICE_URL=http://ocr_service:5001
```

#### Dockerコンテナの起動
```
docker-compose build
```

```
docker-compose up
```

#### localhostにアクセス
```
http://localhost:3000/
```

#### 初期データの投入コマンド
```
docker-compose run web rails db:seed

```
