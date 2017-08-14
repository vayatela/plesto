<?php 
class AccesoriesOnlist extends Module {
	function __construct(){
		$this->name = 'accesoriesonlist';
		$this->tab = 'front_office_features';
        $this->author = 'ventura';
		$this->version = '1.1.0';
        parent::__construct();
		$this->displayName = $this->l('Product Accesories on List');
		$this->description = $this->l('Module displays product accesories on list');
  
 
	}
  
	function install(){
        if (parent::install() == false 
	    OR $this->registerHook('displayAccesoriesOnList') == false
		OR $this->registerHook('header') == false

		
        ){
         return false;
        }
        return true;
	}

	
	public function hookHeader($params)
	{
	 if (isset($this->context->controller->php_self) && $this->context->controller->php_self == 'category'||
                                                        $this->context->controller->php_self === 'index' ||
                                                        $this->context->controller->php_self === 'product')

	 $this->context->controller->addCSS($this->_path.'css/accesoriesonlist.css');
	}

	function hookDisplayAccesoriesOnList($params){
	   $product = new Product($params['product']['id_product']);
        $accessories = $product->getAccessories($this->context->language->id);
        $this->smarty->assign('accessories',$accessories);
        return $this->display(__FILE__, 'accesoriesonlist.tpl');
	}
}
?>