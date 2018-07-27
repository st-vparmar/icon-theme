<!DOCTYPE html>

<#include init />

<html class="${root_css_class}" dir="<@liferay.language key="lang.dir" />" lang="${w3c_language_id}">

<head>
	<title>${the_title} - ${company_name}</title>

	<meta content="initial-scale=1.0, width=device-width" name="viewport" />

	<@liferay_util["include"] page=top_head_include />
</head>

<body class="${css_class}">

<@liferay_ui["quick-access"] contentId="#main-content" />

<@liferay_util["include"] page=body_top_include />

<@liferay.control_menu />

<div class="container-fluid" id="wrapper">
	<header id="banner" role="banner">
		<div class="container">	
			<div class="row header-wrapper">
				<div id="heading">
					<h1 class="site-title">
						<a class="${logo_css_class} site-logo" href="${site_default_url}" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">
							<!--
							<img alt="${logo_description}" height="65" src="${site_logo}" width="138" />
							-->
							<img alt="${logo_description}" src="${site_logo}"/>						
						</a>				
					</h1>
				</div>
				<div class="right-nav-menu">
					<#if is_signed_in>
						<div class="searchbar">	
							<@liferay_portlet["runtime"]
	  							 portletName="com_liferay_portal_search_web_portlet_SearchPortlet"
							/>
						</div>	
						</a>
						<a href="#" class="header-icon-link user-guide">
							<h5 class="user-guide-text">User Guide 
								<i class="fa fa-book" aria-hidden="true"></i>
							</h5>
						</a>
						<a href="#" class="header-icon-link"><i class="fa fa-cog" aria-hidden="true"></i></a>
					</#if>
					<@liferay.user_personal_bar />
				</div>
			</div>	
	 	</div>
		<#if has_navigation && is_setup_complete>
			<#include "${full_templates_path}/navigation.ftl" />
		</#if>
	</header>

	<section id="content" class="container">
		<h1 class="hide-accessible">${the_title}</h1>
	
		<#if selectable>
			<@liferay_util["include"] page=content_include />
		<#else>
			${portletDisplay.recycle()}

			${portletDisplay.setTitle(the_title)}

			<@liferay_theme["wrap-portlet"] page="portlet.ftl" >
				<@liferay_util["include"] page=content_include />
			</@>
		</#if>
	</section>

	<footer id="footer" role="contentinfo">
		<div class="container">
			<#if footer?? && validator.isNotNull(footer)>
				${JournalArticleLocalService.getArticleContent(footer, footer.getDDMTemplateKey(), "VIEW", locale, themeDisplay)}
			</#if>
		</div>
	</footer>
</div>

<@liferay_util["include"] page=body_bottom_include />

<@liferay_util["include"] page=bottom_include />

</body>

</html>