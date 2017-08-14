{if isset($accessories) && $accessories}
<div id="content_accesories">
  <h3>{l s='Accesories' mod='accesoriesonlist'}</h3>
{foreach from=$accessories item=accessory name=accessories_list}
  {if $smarty.foreach.accessories_list.index == 3}{break}{/if}
 {if ($accessory.allow_oosp || $accessory.quantity_all_versions > 0 || $accessory.quantity > 0) && $accessory.available_for_order && !isset($restricted_country_mode)}
			{assign var='accessoryLink' value=$link->getProductLink($accessory.id_product, $accessory.link_rewrite, $accessory.category)}
			<ul class="accesories_frame">
			<li>
			<a href="{$accessoryLink|escape:'html':'UTF-8'}" title="{$accessory.legend|escape:'html':'UTF-8'}" class="product-image product_image">
			<img src="{$link->getImageLink($accessory.link_rewrite, $accessory.id_image, 'cart_default')|escape:'html':'UTF-8'}" alt="{$accessory.legend|escape:'html':'UTF-8'}" width="80" height="80"/>
			</a>
			<h5 itemprop="name" class="product-name">
			<a href="{$accessoryLink|escape:'html':'UTF-8'}">
			{$accessory.name|truncate:15:'...':true|escape:'html':'UTF-8'}
			</a>
			</h5>
		</li>
	   </ul>	
			{/if}
{/foreach}
</div>
{/if}