<?php

class forms_ContactForm extends Zend_Form 
{ 
	const VALIDATION_ERROR_EMPTY = 'Pole jest wymagane i nie może pozostać puste';
	const VALIDATION_ERROR_EMAIL_INVALID = 'Proszę wprowadzić prawidłowy adres e-mail';
	const VALIDATION_ERROR_EMAIL_INVALID_FORMAT = 'Proszę wprowadzić prawidłowy adres e-mail';
	
    public function __construct($options = null) 
    { 
        parent::__construct($options);
	
				$this->setMethod('post');

				$institution = new Zend_Form_Element_Text('institution', array('required' => true, 'label' => 'Instytucja', 'class' => 'text'));
				$institution->addValidator('NotEmpty', true, array ('messages' => array ('isEmpty' => self::VALIDATION_ERROR_EMPTY ) ) );
	
				$name = new Zend_Form_Element_Text('name', array('required' => true, 'label' => 'Imię i nazwisko', 'class' => 'text'));
				$name->addValidator('NotEmpty', true, array ('messages' => array ('isEmpty' => self::VALIDATION_ERROR_EMPTY ) ) );
	
				$position = new Zend_Form_Element_Text('position', array('required' => true, 'label' => 'Stanowisko', 'class' => 'text'));
				$position->addValidator('NotEmpty', true, array ('messages' => array ('isEmpty' => self::VALIDATION_ERROR_EMPTY ) ) );
	
				$email = new Zend_Form_Element_Text('email', array('required' => true, 'label' => 'E-mail', 'class' => 'text'));
				$email->addValidator('NotEmpty', true, array ('messages' => array ('isEmpty' => self::VALIDATION_ERROR_EMPTY ) ) );
				$email->addValidator('EmailAddress', true, array ('messages' => array (
					'emailAddressInvalid' => self::VALIDATION_ERROR_EMAIL_INVALID,
					'emailAddressInvalidFormat' => self::VALIDATION_ERROR_EMAIL_INVALID_FORMAT ) ) );
	
				$telephone = new Zend_Form_Element_Text('telephone', array('required' => true, 'label' => 'Telefon', 'class' => 'text'));
				$telephone->addValidator('NotEmpty', true, array ('messages' => array ('isEmpty' => self::VALIDATION_ERROR_EMPTY ) ) );
	
				$message = new Zend_Form_Element_Textarea('message', array('required' => true, 'label' => 'Wiadomość', 'class' => 'text', 'rows' => 5, 'cols' => 80));
				$message->addValidator('NotEmpty', true, array ('messages' => array ('isEmpty' => self::VALIDATION_ERROR_EMPTY ) ) );
	
				$copy = new Zend_Form_Element_Checkbox('copy', array('label' => 'Prześlij kopię tej wiadomości na swój e-mail'));
	
				$captcha = new Zend_Form_Element_Captcha('captcha', array(
					'captcha' => array(
						'captcha' => 'Dumb',
			    	'wordLen' => 3,
			    	'timeout' => 500
						)
					));

				$submit = new Zend_Form_Element_Submit('submit', array('label' => 'Wyślij', 'class' => 'right'));

				$this->addElements(array($institution, $name, $position, $email, $telephone, $message, $copy, $captcha, $submit));
	}
}