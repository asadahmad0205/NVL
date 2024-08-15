CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_attribute_values AS COPY INTO RAW_JSON_DATA_attribute_values 
FROM
  @attribute_values file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_asset_client_individuals AS COPY INTO RAW_JSON_DATA_asset_client_individuals 
FROM
  @asset_client_individuals file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_deal_document_categories_data AS COPY INTO RAW_JSON_DATA_deal_document_categories_data 
FROM
  @deal_document_categories_data file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_purpose_credit_types AS COPY INTO RAW_JSON_DATA_purpose_credit_types 
FROM
  @purpose_credit_types file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_valuation_statuses AS COPY INTO RAW_JSON_DATA_valuation_statuses 
FROM
  @valuation_statuses file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_sharepoint_updates_timestamps AS COPY INTO RAW_JSON_DATA_sharepoint_updates_timestamps 
FROM
  @sharepoint_updates_timestamps file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_name_titles AS COPY INTO RAW_JSON_DATA_name_titles 
FROM
  @name_titles file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_scheduled_notifications AS COPY INTO RAW_JSON_DATA_scheduled_notifications 
FROM
  @scheduled_notifications file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_attribute_groups AS COPY INTO RAW_JSON_DATA_attribute_groups 
FROM
  @attribute_groups file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_guarantors AS COPY INTO RAW_JSON_DATA_guarantors 
FROM
  @guarantors file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_drawdown_fields_approval AS COPY INTO RAW_JSON_DATA_drawdown_fields_approval 
FROM
  @drawdown_fields_approval file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_broker_agents AS COPY INTO RAW_JSON_DATA_broker_agents 
FROM
  @broker_agents file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_fees AS COPY INTO RAW_JSON_DATA_fees 
FROM
  @fees file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_attribute_entities AS COPY INTO RAW_JSON_DATA_attribute_entities 
FROM
  @attribute_entities file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_deal_notification_rules AS COPY INTO RAW_JSON_DATA_deal_notification_rules 
FROM
  @deal_notification_rules file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_systems_deal_setting AS COPY INTO RAW_JSON_DATA_systems_deal_setting 
FROM
  @systems_deal_setting file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_orders AS COPY INTO RAW_JSON_DATA_orders 
FROM
  @orders file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_payment_attempts AS COPY INTO RAW_JSON_DATA_payment_attempts 
FROM
  @payment_attempts file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_users AS COPY INTO RAW_JSON_DATA_users 
FROM
  @users file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_deal_task AS COPY INTO RAW_JSON_DATA_deal_task 
FROM
  @deal_task file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_broker_agent_deals AS COPY INTO RAW_JSON_DATA_broker_agent_deals 
FROM
  @broker_agent_deals file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_asset_addresses AS COPY INTO RAW_JSON_DATA_asset_addresses 
FROM
  @asset_addresses file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_lender_operational_team_admin AS COPY INTO RAW_JSON_DATA_lender_operational_team_admin 
FROM
  @lender_operational_team_admin file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_client_group_clients AS COPY INTO RAW_JSON_DATA_client_group_clients 
FROM
  @client_group_clients file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_notification AS COPY INTO RAW_JSON_DATA_notification 
FROM
  @notification file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_asset_insurances AS COPY INTO RAW_JSON_DATA_asset_insurances 
FROM
  @asset_insurances file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_exit_fee_tiers AS COPY INTO RAW_JSON_DATA_exit_fee_tiers 
FROM
  @exit_fee_tiers file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_variable_rate_settings AS COPY INTO RAW_JSON_DATA_variable_rate_settings 
FROM
  @variable_rate_settings file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_variable_rates AS COPY INTO RAW_JSON_DATA_variable_rates 
FROM
  @variable_rates file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_user_types AS COPY INTO RAW_JSON_DATA_user_types 
FROM
  @user_types file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_asset_client_companies AS COPY INTO RAW_JSON_DATA_asset_client_companies 
FROM
  @asset_client_companies file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_lenders AS COPY INTO RAW_JSON_DATA_lenders 
FROM
  @lenders file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_drawdowns AS COPY INTO RAW_JSON_DATA_drawdowns 
FROM
  @drawdowns file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_client_companies AS COPY INTO RAW_JSON_DATA_client_companies 
FROM
  @client_companies file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_deal_document_categories AS COPY INTO RAW_JSON_DATA_deal_document_categories 
FROM
  @deal_document_categories file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_loan_administrators AS COPY INTO RAW_JSON_DATA_loan_administrators 
FROM
  @loan_administrators file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_bank_details AS COPY INTO RAW_JSON_DATA_bank_details 
FROM
  @bank_details file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_use_type AS COPY INTO RAW_JSON_DATA_use_type 
FROM
  @use_type file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_drawdown_event_status AS COPY INTO RAW_JSON_DATA_drawdown_event_status 
FROM
  @drawdown_event_status file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_charges AS COPY INTO RAW_JSON_DATA_charges 
FROM
  @charges file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_variable_rates_history AS COPY INTO RAW_JSON_DATA_variable_rates_history 
FROM
  @variable_rates_history file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_variable_rates_history_copy1 AS COPY INTO RAW_JSON_DATA_variable_rates_history_copy1 
FROM
  @variable_rates_history_copy1 file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_activity_log AS COPY INTO RAW_JSON_DATA_activity_log 
FROM
  @activity_log file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_charge_types AS COPY INTO RAW_JSON_DATA_charge_types 
FROM
  @charge_types file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_linked_deals AS COPY INTO RAW_JSON_DATA_linked_deals 
FROM
  @linked_deals file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_client_groups AS COPY INTO RAW_JSON_DATA_client_groups 
FROM
  @client_groups file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_deal_task_group AS COPY INTO RAW_JSON_DATA_deal_task_group 
FROM
  @deal_task_group file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_attributes AS COPY INTO RAW_JSON_DATA_attributes 
FROM
  @attributes file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_client_individuals AS COPY INTO RAW_JSON_DATA_client_individuals 
FROM
  @client_individuals file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_quotes_status AS COPY INTO RAW_JSON_DATA_quotes_status 
FROM
  @quotes_status file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_notes AS COPY INTO RAW_JSON_DATA_notes 
FROM
  @notes file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_role_has_permissions AS COPY INTO RAW_JSON_DATA_role_has_permissions 
FROM
  @role_has_permissions file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_audit AS COPY INTO RAW_JSON_DATA_audit 
FROM
  @audit file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_payments AS COPY INTO RAW_JSON_DATA_payments 
FROM
  @payments file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_client_form_status AS COPY INTO RAW_JSON_DATA_client_form_status 
FROM
  @client_form_status file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_loan_calculation_method AS COPY INTO RAW_JSON_DATA_loan_calculation_method 
FROM
  @loan_calculation_method file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_deal_settings AS COPY INTO RAW_JSON_DATA_deal_settings 
FROM
  @deal_settings file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_personal_access_tokens AS COPY INTO RAW_JSON_DATA_personal_access_tokens 
FROM
  @personal_access_tokens file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_deal_statuses AS COPY INTO RAW_JSON_DATA_deal_statuses 
FROM
  @deal_statuses file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_files AS COPY INTO RAW_JSON_DATA_files 
FROM
  @files file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_asset_types AS COPY INTO RAW_JSON_DATA_asset_types 
FROM
  @asset_types file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_service_providers AS COPY INTO RAW_JSON_DATA_service_providers 
FROM
  @service_providers file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_client_form_attachments AS COPY INTO RAW_JSON_DATA_client_form_attachments 
FROM
  @client_form_attachments file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_deals AS COPY INTO RAW_JSON_DATA_deals 
FROM
  @deals file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_asset_insurance_notes AS COPY INTO RAW_JSON_DATA_asset_insurance_notes 
FROM
  @asset_insurance_notes file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_interest_calculation_types AS COPY INTO RAW_JSON_DATA_interest_calculation_types 
FROM
  @interest_calculation_types file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_brokers AS COPY INTO RAW_JSON_DATA_brokers 
FROM
  @brokers file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_deal_document_risk AS COPY INTO RAW_JSON_DATA_deal_document_risk 
FROM
  @deal_document_risk file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_systems_deal_setting_groups AS COPY INTO RAW_JSON_DATA_systems_deal_setting_groups 
FROM
  @systems_deal_setting_groups file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_form_types AS COPY INTO RAW_JSON_DATA_form_types 
FROM
  @form_types file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_permissions AS COPY INTO RAW_JSON_DATA_permissions 
FROM
  @permissions file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_notification_recipients AS COPY INTO RAW_JSON_DATA_notification_recipients 
FROM
  @notification_recipients file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_deal_documents AS COPY INTO RAW_JSON_DATA_deal_documents 
FROM
  @deal_documents file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_interest_types AS COPY INTO RAW_JSON_DATA_interest_types 
FROM
  @interest_types file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_migrations AS COPY INTO RAW_JSON_DATA_migrations 
FROM
  @migrations file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_variable_rate_sources AS COPY INTO RAW_JSON_DATA_variable_rate_sources 
FROM
  @variable_rate_sources file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_deal_introducers AS COPY INTO RAW_JSON_DATA_deal_introducers 
FROM
  @deal_introducers file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_deal_activities AS COPY INTO RAW_JSON_DATA_deal_activities 
FROM
  @deal_activities file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_drawdown_event_type AS COPY INTO RAW_JSON_DATA_drawdown_event_type 
FROM
  @drawdown_event_type file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_deal_aborted_reasons AS COPY INTO RAW_JSON_DATA_deal_aborted_reasons 
FROM
  @deal_aborted_reasons file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_documents AS COPY INTO RAW_JSON_DATA_documents 
FROM
  @documents file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_drawdown_events AS COPY INTO RAW_JSON_DATA_drawdown_events 
FROM
  @drawdown_events file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_drawdown_status AS COPY INTO RAW_JSON_DATA_drawdown_status 
FROM
  @drawdown_status file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_client_company_notes AS COPY INTO RAW_JSON_DATA_client_company_notes 
FROM
  @client_company_notes file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_broker_notes AS COPY INTO RAW_JSON_DATA_broker_notes 
FROM
  @broker_notes file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_deal_types AS COPY INTO RAW_JSON_DATA_deal_types 
FROM
  @deal_types file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_introducers AS COPY INTO RAW_JSON_DATA_introducers 
FROM
  @introducers file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_assets AS COPY INTO RAW_JSON_DATA_assets 
FROM
  @assets file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_task AS COPY INTO RAW_JSON_DATA_task 
FROM
  @task file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_attribute_types AS COPY INTO RAW_JSON_DATA_attribute_types 
FROM
  @attribute_types file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_client_addresses AS COPY INTO RAW_JSON_DATA_client_addresses 
FROM
  @client_addresses file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_deal_notification_rules_recipients AS COPY INTO RAW_JSON_DATA_deal_notification_rules_recipients 
FROM
  @deal_notification_rules_recipients file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_email_code_authentication AS COPY INTO RAW_JSON_DATA_email_code_authentication 
FROM
  @email_code_authentication file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_loan_custom_forms AS COPY INTO RAW_JSON_DATA_loan_custom_forms 
FROM
  @loan_custom_forms file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_failed_jobs AS COPY INTO RAW_JSON_DATA_failed_jobs 
FROM
  @failed_jobs file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_marketing_sources AS COPY INTO RAW_JSON_DATA_marketing_sources 
FROM
  @marketing_sources file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_deal_notes AS COPY INTO RAW_JSON_DATA_deal_notes 
FROM
  @deal_notes file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_order_statuses AS COPY INTO RAW_JSON_DATA_order_statuses 
FROM
  @order_statuses file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_delegated_owners AS COPY INTO RAW_JSON_DATA_delegated_owners 
FROM
  @delegated_owners file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_ownership_types AS COPY INTO RAW_JSON_DATA_ownership_types 
FROM
  @ownership_types file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_introducer_type AS COPY INTO RAW_JSON_DATA_introducer_type 
FROM
  @introducer_type file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_quotes AS COPY INTO RAW_JSON_DATA_quotes 
FROM
  @quotes file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_fee_status AS COPY INTO RAW_JSON_DATA_fee_status 
FROM
  @fee_status file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_client_individual_notes AS COPY INTO RAW_JSON_DATA_client_individual_notes 
FROM
  @client_individual_notes file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_quotes_recipients AS COPY INTO RAW_JSON_DATA_quotes_recipients 
FROM
  @quotes_recipients file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_currencies AS COPY INTO RAW_JSON_DATA_currencies 
FROM
  @currencies file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_borrowers AS COPY INTO RAW_JSON_DATA_borrowers 
FROM
  @borrowers file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_document_types AS COPY INTO RAW_JSON_DATA_document_types 
FROM
  @document_types file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_marital_statuses AS COPY INTO RAW_JSON_DATA_marital_statuses 
FROM
  @marital_statuses file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_notification_templates AS COPY INTO RAW_JSON_DATA_notification_templates 
FROM
  @notification_templates file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_notification_rules AS COPY INTO RAW_JSON_DATA_notification_rules 
FROM
  @notification_rules file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_deal_rate_floors AS COPY INTO RAW_JSON_DATA_deal_rate_floors 
FROM
  @deal_rate_floors file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_valuations AS COPY INTO RAW_JSON_DATA_valuations 
FROM
  @valuations file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_drawdown_event_amount_type AS COPY INTO RAW_JSON_DATA_drawdown_event_amount_type 
FROM
  @drawdown_event_amount_type file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_model_has_permissions AS COPY INTO RAW_JSON_DATA_model_has_permissions 
FROM
  @model_has_permissions file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_companies AS COPY INTO RAW_JSON_DATA_companies 
FROM
  @companies file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_provider_types AS COPY INTO RAW_JSON_DATA_provider_types 
FROM
  @provider_types file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_roles AS COPY INTO RAW_JSON_DATA_roles 
FROM
  @roles file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_task_group AS COPY INTO RAW_JSON_DATA_task_group 
FROM
  @task_group file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_ccr_reports AS COPY INTO RAW_JSON_DATA_ccr_reports 
FROM
  @ccr_reports file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_quote_note AS COPY INTO RAW_JSON_DATA_quote_note 
FROM
  @quote_note file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_fee_options AS COPY INTO RAW_JSON_DATA_fee_options 
FROM
  @fee_options file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_broker_agent_notes AS COPY INTO RAW_JSON_DATA_broker_agent_notes 
FROM
  @broker_agent_notes file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_client_forms AS COPY INTO RAW_JSON_DATA_client_forms 
FROM
  @client_forms file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_margin_override AS COPY INTO RAW_JSON_DATA_margin_override 
FROM
  @margin_override file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_client_company_clients AS COPY INTO RAW_JSON_DATA_client_company_clients 
FROM
  @client_company_clients file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_fee_type AS COPY INTO RAW_JSON_DATA_fee_type 
FROM
  @fee_type file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_payment_providers AS COPY INTO RAW_JSON_DATA_payment_providers 
FROM
  @payment_providers file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_model_has_roles AS COPY INTO RAW_JSON_DATA_model_has_roles 
FROM
  @model_has_roles file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_deal_setting_groups AS COPY INTO RAW_JSON_DATA_deal_setting_groups 
FROM
  @deal_setting_groups file_format = ( type = JSON );
CREATE 
  OR REPLACE pipe PIPE_RAW_JSON_DATA_password_resets AS COPY INTO RAW_JSON_DATA_password_resets 
FROM
  @password_resets file_format = ( type = JSON );