INSERT  INTO
	alipay_messagelog
      ( 
      id                            
      ,message_type                   
      ,message_content  
      ,content_id                     
      ,receive_message  
      ,create_date                    
      ) 
values
      (
      :alipayMessagelog.id                            
      ,:alipayMessagelog.messageType                   
      ,:alipayMessagelog.messageContent
      ,:alipayMessagelog.contentId                     
      ,:alipayMessagelog.receiveMessage                
      ,:alipayMessagelog.createDate                    
      )