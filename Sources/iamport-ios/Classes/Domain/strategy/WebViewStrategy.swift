//
// Created by BingBong on 2021/01/08.
//

import Foundation
import WebKit
import RxBus
import RxSwift

class WebViewStrategy: BaseWebViewStrategy {

    override func doWork(_ payment: Payment) {
        super.doWork(payment)
        print("헬로 WebViewStrategy")
        // 오픈 웹뷰!
        RxBus.shared.post(event: EventBus.WebViewEvents.OpenWebView())
    }

    override func onUpdatedUrl(url: URL) {
        super.onUpdatedUrl(url: url)

        if (url.scheme == CONST.ABOUT_BLANK_SCHEME) {
            return // 이동하지 않음
        }

        if (Utils.isAppUrl(url)) {
            RxBus.shared.post(event: EventBus.WebViewEvents.ThirdPartyUri(thirdPartyUri: url))
            return
        }

        if (Utils.isPaymentOver(url)) {
            let response = Utils.getQueryStringToImpResponse(url)
            dlog("paymentOver :: \(String(describing: response))")
            ddump(response)
            sdkFinish(response)
            return
        }
    }
}
