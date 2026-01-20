# LLxprt Code Docker 映像檔

![GitHub Actions Workflow Status](https://github.com/chihualu/opencode/actions/workflows/publish.yml/badge.svg)
![License](https://img.shields.io/github/license/chihualu/opencode)

本專案提供了一個 Docker 化的 **[LLxprt Code](https://github.com/vybestack/llxprt-code)** 環境。LLxprt Code 是一個強大的 AI CLI 開發工具，支援多種 LLM Provider。

## 功能特色

*   **核心**: 基於 Node.js 20 與 `@vybestack/llxprt-code`。
*   **彈性**: 支援透過環境變數設定 API Base URL 和 API Key。
*   **輕量**: 使用 `node:20-slim` 作為基底。

## 快速開始

### 啟動容器

您可以使用以下指令來啟動容器並進入互動模式：

```bash
docker run -it --rm \
  -v $(pwd):/workspace \
  -e API_BASEURL="https://your-api-endpoint.com/v1" \
  -e API_KEY="your-secret-api-key" \
  -e PROVIDER="openai" \
  -e MODEL="gpt-4o" \
  ghcr.io/chihualu/opencode:latest
```

**參數說明：**

*   **`-v $(pwd):/workspace`**: 將目前目錄掛載到容器內，讓 LLxprt 可以讀寫您的程式碼。
*   **`-e API_BASEURL`**: 您的 OpenAI 相容 API 網址。
*   **`-e API_KEY`**: 您的 API 金鑰 (會自動設定為 `OPENAI_API_KEY`)。
*   **`-e PROVIDER`**: 指定 Provider (預設: `openai`)。
*   **`-e MODEL`**: 指定使用的模型 (預設: `gpt-4o`)。

### 進階指令

您也可以直接傳遞參數給 `llxprt`：

```bash
docker run -it --rm ghcr.io/chihualu/opencode:latest --help
```

## 授權條款 (License) 

本專案採用 MIT License 授權 - 詳細內容請參閱 [LICENSE](LICENSE) 檔案。
