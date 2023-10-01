# 決済画面

・ユーザがアプリをインストールしていなくても利用できる
・Strip決済、PayPay決済、Giftee送信から選択する
・ボタン押下後、各APIが発火して決済処理が走る。
・決済が完了したら完了画面に遷移し、アプリのインストールを促す
→ 決済した情報は端末に保存し、会員登録が完了したら反映させる

必要API
・StripeAPI
・PayPayAPI
・GifteeAPI

フレームワークは検討中
・express
・NestJS

```
├── lib/
│   ├── main.dart
│   ├── app.dart
│   ├── views/
│   │   ├── home_view.dart
│   │   └── ...
│   ├── widgets/
│   │   ├── payment_button.dart
│   │   └── ...
│   ├── models/
│   │   ├── user.dart
│   │   └── payment.dart
│   ├── services/
│   │   ├── paypay_service.dart
│   │   ├── stripe_service.dart
│   │   └── user_service.dart
│   ├── utils/
│   │   ├── constants.dart
│   │   └── ...
│   └── config/
│       ├── routes.dart
│       └── ...
├── web/
│   ├── index.html
│   ├── favicon.png
│   └── ...
├── pubspec.yaml
└── README.md

```
