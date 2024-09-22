FROM ruby:3.1.4

# 必要なライブラリをインストール
RUN apt-get update -qq && apt-get install -y build-essential default-libmysqlclient-dev


# 作業ディレクトリを設定
WORKDIR /app

# GemfileとGemfile.lockをコピーし、bundle installを実行
COPY Gemfile Gemfile.lock ./
RUN bundle install

# アプリケーションのソースコードをコピー
COPY . ./

# ポートを指定
EXPOSE 3000

# サーバーを起動
CMD ["rails", "server", "-b", "0.0.0.0"]
