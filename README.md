# Terraform Infrastructure Samples

このリポジトリは、Terraformを使用してAWSおよびGoogle Cloud Platform (GCP) 上に基本的なインフラストラクチャ（Webサーバー）を構築するためのサンプルコードを含んでいます。

## ディレクトリ構成

- **`aws/`**: AWS用のTerraform設定ファイル
  - Amazon Linux 2023を使用したEC2インスタンスを作成します。
  - Apache HTTP Serverをインストールし、起動時にサンプルページを作成します。
  - セキュリティグループでHTTP (80) と SSH (22) のアクセスを許可します。

- **`gcp/`**: GCP用のTerraform設定ファイル
  - Debian 11を使用したGoogle Compute Engineインスタンスを作成します。
  - Apache HTTP Serverをインストールし、起動時にサンプルページを作成します。
  - ファイアウォールルールでHTTP (80) のアクセスを許可します。

## 前提条件

このコードを実行するには、以下のツールがインストールされ、適切に設定されている必要があります。

- [Terraform CLI](https://developer.hashicorp.com/terraform/downloads)
- クラウドプロバイダーのCLIツールおよび認証設定:
  - **AWS:** [AWS CLI](https://aws.amazon.com/cli/) (`aws configure` で認証情報を設定)
  - **GCP:** [Google Cloud SDK](https://cloud.google.com/sdk) (`gcloud auth application-default login` で認証情報を設定)

## 使い方

### AWS

1. `aws` ディレクトリに移動します。
   ```bash
   cd aws
   ```

2. Terraformを初期化します。
   ```bash
   terraform init
   ```

3. 実行計画を確認し、適用します。
   ```bash
   terraform apply
   ```
   確認プロンプトが表示されたら `yes` と入力します。

4. 完了後、出力されたパブリックIPアドレスにブラウザでアクセスして動作を確認できます。

### GCP

1. `gcp` ディレクトリに移動します。
   ```bash
   cd gcp
   ```

2. 変数ファイルを作成します。
   `terraform.tfvars.example` を `terraform.tfvars` にコピーし、ご自身のGCPプロジェクトIDを設定してください。
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   # terraform.tfvars ファイルを開き、project_id = "your-project-id" を編集
   ```

3. Terraformを初期化します。
   ```bash
   terraform init
   ```

4. 実行計画を確認し、適用します。
   ```bash
   terraform apply
   ```
   確認プロンプトが表示されたら `yes` と入力します。
