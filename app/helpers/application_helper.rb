module ApplicationHelper

  BOOTSTRAP_FLASH_MSG = {
  success: 'alert-success',
  error: 'alert-danger',
  alert: 'alert-danger',
  notice: 'alert-success'
  }

  def bootstrap_class_for(flash_type)
    BOOTSTRAP_FLASH_MSG.fetch(flash_type.to_sym, flash_type.to_s)
  end
end
