<!DOCTYPE html>

<html lang="en">
	<head>
		<#include "common/head.ftl">
	</head>
	<body class="tm-background">
		<div class="tm-middle">
			<div class="uk-container uk-container-center">
				<div class="uk-grid">
					<div class="tm-main uk-width-medium-3-4">
						<article class="uk-article">
							<div class="uk-block uk-block-secondary uk-contrast uk-block-large">
								<div class="uk-container">
									<h2>${message}</h2>
								</div>
							</div>

							<div class="uk-block uk-block-secondary uk-contrast uk-block-large">
								<div class="uk-container">
									<h3>GET方式参数：</h3>
									<div class="uk-grid uk-grid-match" data-uk-grid-margin="">
										<div class="uk-width-medium-1-1">
											<div class="uk-panel">
												<p style="word-wrap: break-word;word-break: break-all;overflow: hidden;">
													${getReqData}
												</p>
											</div>
										</div>
								</div>
							</div>

							<div class="uk-block uk-block-secondary uk-contrast uk-block-large">
								<div class="uk-container">
									<h3>参数解析：</h3>
									<div class="uk-grid uk-grid-match" data-uk-grid-margin="">
										<div class="uk-width-medium-1-2">
											<div class="uk-panel">
												<#list dataMap?keys as key>
													<p style="word-wrap: break-word;word-break: break-all;overflow: hidden;">
														 ${key}:${dataMap[key]}
													</p>
												</#list>
											</div>
										</div>
									</div>
								</div>
							</div>
						</article>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
