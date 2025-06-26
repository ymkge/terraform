EC2インスタンスをデプロイする手順を分かりやすく説明するREADME.mdです。

Markdown

# AWS EC2 Instance with Terraform

このリポジトリは、Terraform を使用して Amazon Web Services (AWS) に EC2 VM インスタンスをデプロイするための基本的な構成を提供します。

## 構成内容

* **EC2 VM インスタンス**: 指定されたAMIとインスタンスタイプでEC2インスタンスをプロビジョニングします。
* **セキュリティグループ**: HTTP (ポート 80) および SSH (ポート 22) トラフィックを許可するセキュリティグループを設定し、デプロイされたインスタンスにアクセスできるようにします。
* **ユーザーデータ**: インスタンス起動時に Apache ウェブサーバーをインストールし、簡単な "Hello from Terraform!" ページをホストするスクリプトを実行します。

## 事前準備

Terraform を実行する前に、以下の準備が必要です。

1.  **AWS CLI のインストール**:
    [AWS CLI のインストール手順](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html) に従ってインストールしてください。

2.  **AWS 認証情報の構成**:
    Terraform が AWS リソースを管理できるように、認証情報を設定します。
    ```bash
    aws configure
    ```
    このコマンドを実行すると、`~/.aws/credentials` にアクセスキーとシークレットキーが保存されます。

3.  **AMI ID の確認**:
    `variables.tf`で指定されているAMI IDが、お使いのリージョンで最新かつ正しいAMI IDであることを確認してください。AMI IDはリージョンによって異なります。

## デプロイ手順

1.  **リポジトリのクローン**:
    ```bash
    git clone [https://github.com/your-username/your-repository-name.git](https://github.com/your-username/your-repository-name.git)
    cd your-repository-name/terraform
    ```

2.  **Terraform の初期化**:
    Terraform のプロバイダプラグインをダウンロードします。
    ```bash
    terraform init
    ```

3.  **デプロイ計画の確認**:
    Terraform が実行する変更内容を確認します。
    ```bash
    terraform plan
    ```
    このコマンドは、実際にリソースが作成される前に、どのような変更が行われるかを詳細に表示します。

4.  **リソースの適用**:
    計画された変更を適用し、AWS リソースを作成します。
    ```bash
    terraform apply
    ```
    プロンプトが表示されたら `yes` と入力して実行を確定します。

5.  **EC2 インスタンスへのアクセス**:
    デプロイが完了すると、コンソールにインスタンスのパブリックIPアドレスが表示されます。
    
    ```bash
    # 例
    Outputs:

    public_ip = "xx.xx.xx.xx"
    ```

    このIPアドレスにウェブブラウザでアクセスすると、デプロイしたウェブページが表示されます。

## リソースの削除

作成した AWS リソースが不要になった場合は、以下のコマンドで削除できます。

```bash
terraform destroy
プロンプトが表示されたら yes と入力して実行を確定します。

注意事項
セキュリティ: この構成では、SSH (ポート22) および HTTP (ポート80) のアクセスがすべてのIPアドレス (0.0.0.0/0) から許可されています。本番環境では、source_cidr を特定のIPアドレス範囲に制限するなど、セキュリティグループのルールを厳格化してください。

SSHキーペア: このコードはSSHキーペアの作成・設定を含んでいません。SSHでインスタンスにアクセスするには、事前にキーペアを作成し、aws_instanceリソースにkey_nameを追加する必要があります。

terraform.tfvars には機密情報が含まれる可能性があるため、GitHub に直接コミットしないでください。.gitignore ファイルに terraform.tfvars を追加することをお勧めします。

貢献
このリポジトリへの貢献は大歓迎です。バグ報告や機能改善のプルリクエストをお待ちしております。

ライセンス
このプロジェクトは MIT License の下でライセンスされています。