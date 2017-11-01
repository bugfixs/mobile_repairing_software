class GeneralSettingsController < ApplicationController
	def new
		@general_setting = current_user.general_setting
	end

	def update
    @general_setting = GeneralSetting.shod(params[:id])
    if current_user.role == "SuperAdmin" && current_user.id ==1
      @password = @general_setting.password
    if @general_setting.update(general_setting_params)
      current_user.update(password: @general_setting.password)
      flash[:notice] = t('setting_update')
      redirect_to dashboard_home_index_path
    else
      render 'new'
    end
  end
  end

  private

  # this private methods tell us exactly which parameters are allowed
  # into our controller actions.
  def general_setting_params
    params.require(:general_setting).permit!
  end
end
 