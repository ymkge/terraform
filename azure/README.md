# Terraform for Azure

このディレクトリには、Azure上にWebサーバー（Ubuntu + Apache）を構築するためのTerraform設定ファイルが含まれています。

## 構成内容

*   **Region**: Japan East (東京)
*   **OS**: Ubuntu Server 22.04 LTS
*   **Web Server**: Apache2
*   **Network**: VNet, Subnet, Public IP, Security Group (Allow HTTP:80, SSH:22)

## 使い方

1.  Azure CLIでログインします:
    ```bash
    az login
    ```
2.  初期化します:
    ```bash
    terraform init
    ```
3.  実行計画を確認します:
    ```bash
    terraform plan
    ```
4.  リソースを作成します:
    ```bash
    terraform apply
    ```

## 出力

*   `public_ip_address`: 作成されたWebサーバーのパブリックIPアドレス
*   `tls_private_key`: SSH接続用の秘密鍵（sensitiveのため、`terraform output -raw tls_private_key` で確認可能）
