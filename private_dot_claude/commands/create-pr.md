---
description: 現在のブランチから Pull Request を作成する。pr-creator サブエージェント経由で実行する
argument-hint: [省略可: PR の補足情報 / scope / 特記事項など]
---

# Create PR

Pull Request の作成を `pr-creator` サブエージェントに委譲する。

## あなたのタスク

`Agent` ツールを使い、`subagent_type: "pr-creator"` でサブエージェントを起動する。

サブエージェントへ渡すプロンプトには以下を含める:

- ユーザーが `/create-pr` で明示的に PR 作成を依頼したこと
- `$ARGUMENTS` が空でなければ、そのまま追加コンテキストとして渡す（scope、特記事項、PR タイトルのヒントなど）
- PR の本文フォーマットは以下を厳守すること:

  ```
  ## Why

  ## What
  ```

- `## What` はハイレベルな変更内容のみ。変更したファイル名・関数名などの詳細は書かない
- 末尾に "Generated with Claude Code" などの署名は付けない
- PR タイトルは Conventional Commits 形式（`<type>(<scope>): <summary>`）

## サブエージェントの戻り値を受け取った後

- 作成された PR の URL をユーザーに提示する
