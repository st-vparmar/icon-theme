<#assign JournalArticleLocalService = serviceLocator.findService("com.liferay.journal.service.JournalArticleLocalService")>

<#if !validator.isBlank(theme_settings["Footer"]) && JournalArticleLocalService.fetchArticle(themeDisplay.getScopeGroupId(), theme_settings["Footer"])??>
	<#assign footer = JournalArticleLocalService.fetchArticle(themeDisplay.getScopeGroupId(), theme_settings["Footer"]) />
</#if>
