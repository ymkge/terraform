# Terraform Infrastructure Samples

このリポジトリは、Terraformを使用して主要なクラウドプロバイダー（AWS, GCP, Azure）上に基本的なインフラストラクチャ（Webサーバー）を構築するためのサンプルコードを含んでいます。

## ディレクトリ構成

- **`aws/`**: AWS用のTerraform設定ファイル
  - Amazon Linux 2023を使用したEC2インスタンスを作成します。
  - Apache HTTP Serverをインストールし、起動時にサンプルページを作成します。
  - セキュリティグループでHTTP (80) と SSH (22) のアクセスを許可します。

- **`gcp/`**: GCP用のTerraform設定ファイル
  - Debian 11を使用したGoogle Compute Engineインスタンスを作成します。
  - Apache HTTP Serverをインストールし、起動時にサンプルページを作成します。
  - ファイアウォールルールでHTTP (80) のアクセスを許可します。

- **`azure/`**: Azure用のTerraform設定ファイル
  - Ubuntu Server 22.04 LTSを使用したAzure Virtual Machinesを作成します。
  - Apache HTTP Serverをインストールし、起動時にサンプルページを作成します。
  - ネットワークセキュリティグループでHTTP (80) と SSH (22) のアクセスを許可します。

## 前提条件

このコードを実行するには、以下のツールがインストールされ、適切に設定されている必要があります。

- [Terraform CLI](https://developer.hashicorp.com/terraform/downloads)
- クラウドプロバイダーのCLIツールおよび認証設定:
  - **AWS:** [AWS CLI](https://aws.amazon.com/cli/) (`aws configure` で認証情報を設定)
  - **GCP:** [Google Cloud SDK](https://cloud.google.com/sdk) (`gcloud auth application-default login` で認証情報を設定)
  - **Azure:** [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli) (`az login` で認証情報を設定)

## 使い方

共通の手順として、各ディレクトリに移動して以下のコマンドを実行します。

1. **初期化**: `terraform init`
2. **計画確認**: `terraform plan`
3. **適用**: `terraform apply`

### クラウド別補足事項

#### AWS
- `aws configure` でデフォルトリージョンとクレデンシャルが設定されていることを確認してください。

#### GCP
- `terraform.tfvars.example` を `terraform.tfvars` にコピーし、ご自身のGCPプロジェクトIDを設定してください。
- `gcloud auth application-default login` で認証を済ませてください。

#### Azure
- `az login` でログインしていることを確認してください。
- インスタンス作成時に自動生成されるSSH秘密鍵は、`terraform output -raw tls_private_key` で取得可能です。