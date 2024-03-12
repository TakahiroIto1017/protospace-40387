# 必要な機能

| 機能               | コントローラー | アクション  | ビュー      |
| ------------------ | -----------  | ----------- | ---------- |
| ユーザー管理        | device       |             |            |
| プロトタイプ一覧表示 | prototypes   | index       | index      |
| プロトタイプ新規投稿 | prototypes   | new, create | new        |
| プロトタイプ詳細表示 | prototypes   | show        | show       |
| プロトタイプ編集    | prototypes   | edit, update | show, edit |
| プロトタイプ削除    | prototypes   | destroy      | show       |
| ユーザー詳細表示    | users        | show         | show       |
| コメント            | comments     | create      | show       |

## ユーザー管理

### 新規登録

- 正しく登録 => トップページに戻る
- 適切な値が入力されていない => 新規登録ページに留まる

### ログイン

- 正しくログイン => トップページに戻る
- 誤った情報 => ログインページに留まる

### ログアウト

- トップページのログアウトボタン

### トップページ

- ログインしていない時：ヘッダーがログインと新規登録
- ログインしている時：ヘッダーがログアウトとNew Proto

# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name               | string | null: false               |
| profile            | text   | null: false               |
| occupation         | text   | null: false               |
| position           | text   | null: false               |

### Association

- has_many :prototypes
- has_many :comments

## prototypes テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| title      | string     | null: false                    |
| catch_copy | text       | null: false                    |
| concept    | text       | null: false                    |
| user       | references | null: false, foreign_key: true |
※imageはActiveStorage

### Association

- belongs_to :user
- has_many :comments

## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| content   | text       | null: false                    |
| prototype | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :prototype