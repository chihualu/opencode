# ProCode Docker 映像檔

![GitHub Actions Workflow Status](https://github.com/chihualu/procode/actions/workflows/publish.yml/badge.svg)
![License](https://img.shields.io/github/license/chihualu/procode)

本專案提供了一個 Docker 化的 **[LLxprt Code](https://github.com/vybestack/llxprt-code)** 環境，並命名為 **ProCode**。

## 🚀 功能特色

*   **強大核心**: 基於 Node.js 20 與最新版 `@vybestack/llxprt-code`。
*   **專業級配置**: 內建 **Senior Java Architect & Engineer** 系統提示詞 (`core.md`)。
*   **靈活安全**: 支援透過環境變數注入 API Base URL 和 API Key，無需將敏感資訊寫死在映像檔中。
*   **預設 Profile**: 自動載入 `provision` 設定檔，開箱即用。
*   **輕量化**: 使用 `node:20-slim` 映像檔，兼顧效能與體積。

## 📦 快速開始

### 啟動容器 (互動模式)

使用以下指令啟動 ProCode 並直接進入互動式 AI 開發介面：

```bash
docker run -it --rm \
  --name procode \
  -v $(pwd):/workspace \
  -e API_BASEURL="https://your-api-endpoint.com/v1" \
  -e API_KEY="您的-API-KEY" \
  ghcr.io/chihualu/procode:latest
```

**參數說明：**

*   **`--name procode`**: 將容器命名為 `procode`。
*   **`-v $(pwd):/workspace`**: 將目前目錄掛載到容器的工作目錄，讓 AI 可以讀取與修改您的程式碼。
*   **`-e API_BASEURL`**: 指定 OpenAI 相容 API 的端點網址。
*   **`-e API_KEY`**: 指定您的 API 金鑰（會自動填入容器內的 `provision.json` 設定檔中）。

## 🛠️ 內建提示詞 (System Prompt)

本映像檔已預載了專為資深 Java 工程師設計的系統提示詞，路徑位於：
`~/.llxprt/prompts/providers/openai/core.md`

這份提示詞會引導 AI 以 **Java 架構師** 的視角提供建議，專注於：
*   SOLID 原則與 Clean Architecture。
*   JVM 效能優化與並行處理。
*   安全性 (OWASP) 與現代 Java 特性 (Virtual Threads, Records)。

## ⌨️ 進階用法

您可以直接傳遞任何 `llxprt` 支援的參數：

```bash
# 查看幫助
docker run -it --rm ghcr.io/chihualu/procode:latest --help

# 載入特定 Profile
docker run -it --rm ghcr.io/chihualu/procode:latest /profile load your_profile
```

## 📄 授權條款 (License)

本專案採用 **Apache License 2.0** 授權 - 詳細內容請參閱 [LICENSE](LICENSE) 檔案。