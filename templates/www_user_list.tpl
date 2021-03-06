{* Smarty *}

{include file="www_header.tpl"}

{if $users|@count > 0}

<div class="row-fluid noprint ligneInfos">
	<a href="javascript:xajax_modifUser();undefined;" class="btn btn-small" ><img src="images/adduser.png" border="0"> {#menuCreerUser#}</a>
	<a href="{$BASE}/user_groupes.php" class="btn btn-small" style="margin-left:10px;"><img src="images/user_groupes.png" border="0"> {#menuGroupesUsers#}</a>
</div>

<br />

<table class="table table-striped" cellpadding="0" cellspacing="0" style="width:980px">
<tr>
	<th>&nbsp;</th>
	<th align="center">
		{if $order eq "nom"}
			{if $by eq "asc"}
				<a href="{$BASE}/user_list.php?page=1&order=nom&by=desc">{#user_nom#}</a>&nbsp;<img src="{$BASE}/images/asc_order.png" border="0" alt="" />
			{else}
				<a href="{$BASE}/user_list.php?page=1&order=nom&by=asc">{#user_nom#}</a>&nbsp;<img src="{$BASE}/images/desc_order.png" border="0" alt="" />
			{/if}
		{else}
			<a href="{$BASE}/user_list.php?page=1&order=nom&by={$by}">{#user_nom#}</a>
		{/if}
	</th>
	<th align="center">
		{#user_groupe#}
	</th>
	<th align="center">
		{#user_droits_court#}
	</th>
	<th align="center">
		{if $order eq "email"}
			{if $by eq "asc"}
				<a href="{$BASE}/user_list.php?page=1&order=email&by=desc">{#user_email#}</a>&nbsp;<img src="{$BASE}/images/asc_order.png" border="0" alt="" />
			{else}
				<a href="{$BASE}/user_list.php?page=1&order=email&by=asc">{#user_email#}</a>&nbsp;<img src="{$BASE}/images/desc_order.png" border="0" alt="" />
			{/if}
		{else}
			<a href="{$BASE}/user_list.php?page=1&order=email&by={$by}">{#user_email#}</a>
		{/if}
	</th>
	<th align="center">
		{if $order eq "user_id"}
			{if $by eq "asc"}
				<a href="{$BASE}/user_list.php?page=1&order=user_id&by=desc">{#user_identifiant#}</a>&nbsp;<img src="{$BASE}/images/asc_order.png" border="0" alt="" />
			{else}
				<a href="{$BASE}/user_list.php?page=1&order=user_id&by=asc">{#user_identifiant#}</a>&nbsp;<img src="{$BASE}/images/desc_order.png" border="0" alt="" />
			{/if}
		{else}
			<a href="{$BASE}/user_list.php?page=1&order=user_id&by={$by}">{#user_identifiant#}</a>
		{/if}
	</th>
	<th align="center">
		{if $order eq "login"}
			{if $by eq "asc"}
				<a href="{$BASE}/user_list.php?page=1&order=login&by=desc">{#user_login#}</a>&nbsp;<img src="{$BASE}/images/asc_order.png" border="0" alt="" />
			{else}
				<a href="{$BASE}/user_list.php?page=1&order=login&by=asc">{#user_login#}</a>&nbsp;<img src="{$BASE}/images/desc_order.png" border="0" alt="" />
			{/if}
		{else}
			<a href="{$BASE}/user_list.php?page=1&order=login&by={$by}">{#user_login#}</a>
		{/if}
	</th>
	<th align="center">
		{if $order eq "visible_planning"}
			{if $by eq "asc"}
				<a href="{$BASE}/user_list.php?page=1&order=visible_planning&by=desc">{#user_visiblePlanning#}</a>&nbsp;<img src="{$BASE}/images/asc_order.png" border="0" alt="" />
			{else}
				<a href="{$BASE}/user_list.php?page=1&order=visible_planning&by=asc">{#user_visiblePlanning#}</a>&nbsp;<img src="{$BASE}/images/desc_order.png" border="0" alt="" />
			{/if}
		{else}
			<a href="{$BASE}/user_list.php?page=1&order=visible_planning&by={$by}">{#user_visiblePlanning#}</a>
		{/if}
	</th>
	<th>{#user_liste_NBPeriodes#}</th>

</tr>
{foreach name=users item=user from=$users}
	<tr bgcolor="#FFFFFF" onMouseOver="javascript:this.style.backgroundColor='#EEEEEE'" onMouseOut="javascript:this.style.backgroundColor='#FFFFFF'">
		<td align="center" nowrap="nowrap">
			<a href="javascript:xajax_modifUser('{$user.user_id|urlencode}');undefined;"><img src="{$BASE}/images/edit.gif" border="0" width="16" height="16" /></a>
			&nbsp;
			<a href="javascript:xajax_supprimerUser('{$user.user_id|urlencode}');undefined;" onClick="javascript:return confirm('{#user_liste_confirmSuppr#|escape:"javascript"}')"><img src="{$BASE}/images/delete.gif" border="0" width="16" height="16" /></a>
		</td>
		<td>{$user.nom|xss_protect}&nbsp;</td>
		<td>{$user.nom_groupe|xss_protect}&nbsp;</td>
		<td style="font-size:9px">
			{if in_array("users_manage_all", $user.tabDroits)}{#droits_utilisateurs#}&nbsp;{/if}
			{if in_array("projects_manage_all", $user.tabDroits) || in_array("projects_manage_own", $user.tabDroits)}{#droits_projets#}&nbsp;{/if}
			{if in_array("projectgroups_manage_all", $user.tabDroits)}{#droits_groupesProjets#}&nbsp;{/if}
			{if in_array("planning_modify_all", $user.tabDroits) || in_array("planning_modify_own_project", $user.tabDroits) || in_array("planning_modify_own_task", $user.tabDroits)}{#droits_modifPlanning#}&nbsp;{/if}
			{if in_array("parameters_modify", $user.tabDroits)}{#droits_parametres#}&nbsp;{/if}
			&nbsp;
		</td>
		<td>
			{if $user.email neq ""}
				<a href="mailto:{$user.email|xss_protect}">{$user.email|xss_protect}</a>
			{/if}
			&nbsp;
		</td>
		<td>
			&nbsp;
			{assign var=couleurTexte value='#'|cat:$user.couleur|buttonFontColor}
			<span style="padding:3px;color:{$couleurTexte};background-color:#{$user.couleur}">{$user.user_id}</span>
		</td>
		<td>{$user.login}&nbsp;</td>
		<td align="center">
			{assign var=valTmp value=$user.visible_planning}
			{$smarty.config.$valTmp}
			&nbsp;
		</td>
		<td align="center">{$user.totalPeriodes}&nbsp;</td>
	</tr>
{/foreach}
{if $nbPages > 1}
	<tr>
		<td colspan="7" align="right">
			{if $currentPage > 1}<a href="{$BASE}/user_list.php?page={$currentPage-1}">&lt;&lt; {#action_precedent#}</a>&nbsp;&nbsp;{/if}
			{section name=pagination loop=$nbPages}
				{if $smarty.section.pagination.iteration == $currentPage}<b>{else}<a href="{$BASE}/user_list.php?page={$smarty.section.pagination.iteration}">{/if}
				{$smarty.section.pagination.iteration}
				{if $smarty.section.pagination.iteration == $currentPage}</b>{else}</a>{/if}&nbsp;
			{/section}
			{if $currentPage < $nbPages}<a href="{$BASE}/user_list.php?page={$currentPage+1}">{#action_suivant#} &gt;&gt;</a>{/if}
		</td>
	</tr>
{/if}
</table><br />
{else}
	{#info_noRecord#}
{/if}

{include file="www_footer.tpl"}