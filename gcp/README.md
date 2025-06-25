# GCP GCE VM Instance with Terraform

このリポジトリは、Terraform を使用して Google Cloud Platform (GCP) に Compute Engine (GCE) VM インスタンスをデプロイするための基本的な構成を提供します。

## 構成内容

* **GCE VM インスタンス**: 指定されたマシンタイプとイメージで VM インスタンスをプロビジョニングします。
* **ファイアウォールルール**: HTTP (ポート 80) トラフィックを許可するファイアウォールルールを設定し、デプロイされた VM にアクセスできるようにします。
* **起動スクリプト**: VM 起動時に Apache2 ウェブサーバーをインストールし、簡単な "Hello from Terraform!" ページをホストするスクリプトを実行します。

## 事前準備

Terraform を実行する前に、以下の準備が必要です。

1.  **Google Cloud SDK のインストール**:
    [Google Cloud SDK のインストール手順](https://cloud.google.com/sdk/docs/install) に従ってインストールしてください。

2.  **GCP プロジェクトの準備**:
    Terraform をデプロイする GCP プロジェクトが必要です。プロジェクトがまだない場合は、GCP コンソールで作成してください。

3.  **認証情報の構成**:
    Terraform が GCP リソースを管理できるように、認証情報を設定します。
    ```bash
    gcloud auth application-default login
    ```
    これにより、Terraform が使用するアプリケーションのデフォルト認証情報が設定されます。

## デプロイ手順

1.  **リポジトリのクローン**:
    ```bash
    git clone [https://github.com/your-username/your-repository-name.git](https://github.com/your-username/your-repository-name.git)
    cd your-repository-name/terraform
    ```

2.  **`terraform.tfvars` ファイルの作成**:
    `terraform.tfvars.example` をコピーして `terraform.tfvars` を作成し、`project_id` をあなたの GCP プロジェクト ID に置き換えてください。
    ```bash
    cp terraform.tfvars.example terraform.tfvars
    # terraform.tfvars を編集し、project_id を設定してください
    ```
    例:
    ```terraform
    project_id = "your-gcp-project-id"
    ```

3.  **Terraform の初期化**:
    Terraform のプロバイダプラグインをダウンロードします。
    ```bash
    terraform init
    ```

4.  **デプロイ計画の確認**:
    Terraform が実行する変更内容を確認します。
    ```bash
    terraform plan
    ```
    このコマンドは、実際にリソースが作成される前に、どのような変更が行われるかを詳細に表示します。

5.  **リソースの適用**:
    計画された変更を適用し、GCP リソースを作成します。
    ```bash
    terraform apply
    ```
    プロンプトが表示されたら `yes` と入力して実行を確定します。

6.  **VM インスタンスへのアクセス**:
    デプロイが完了したら、GCP コンソールで VM インスタンスの外部 IP アドレスを確認し、ウェブブラウザでアクセスして Apache2 が起動していることを確認できます。

## リソースの削除

作成した GCP リソースが不要になった場合は、以下のコマンドで削除できます。

```bash
terraform destroy