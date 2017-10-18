class GeneralSettingsController < ApplicationController
	def new
		@general_setting = current_user.general_setting
	end

	def update
    @general_setting = GeneralSetting.shod(params[:id])
    if @general_setting.update(general_setting_params)
      flash[:notice] = t('setting_update')
      redirect_to dashboard_home_index_path
    else
      render 'new'
    end
  end

  private

  # this private methods tell us exactly which parameters are allowed
  # into our controller actions.
  def general_setting_params
    params.require(:general_setting).permit!
  end
end
