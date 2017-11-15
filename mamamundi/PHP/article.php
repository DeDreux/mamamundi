<?php
	class Article{
		private $_id;
		private $_titre;
		private $_corps;

	function __construct ($id,$titre,$corps){
		$this->_id=$id;
		$this->_titre=$titre;
		$this->_corps=$corps;
	}
	
	function getId(){
		return $this->_id;
	}

	function getTitre(){
		return $this->_titre;
	}

	function getCorps(){
		return $this->_corps;
	}

	function setId(){
		return $this->_id;
	}

	function setTitre(){
		return $this->_titre;
	}

	function setCorps(){
		return $this->_corps;
	}
}
?>
