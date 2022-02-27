class UsersController < ApplicationController

  def index
    # @users = if current_user.roles.any? { |r| r.name == "superadmin" }
    #            User.where.not(id: current_user.id)
    #          else
               @users = User.all
             # end

    # if current_user.roles.any? { |r| r.name == "superadmin" }
    #   @users = User.where.not(id: current_user.id)
    # elsif current_user.roles.any? { |r| r.name == "Admin Persediaan" }
    #   @users = User.includes(role_assignments: :role)
    # else
    #   @users = User.all
    # end

  end

  def new
    @user = User.new
  end

  def create
    if params[:username].present?
      @user = User.new(user_params)
      @user.username = params[:username]
      ldap = Net::LDAP.new :host => '192.168.60.159',
                           :port => 389,
                           :auth => {
                             :method => :simple,
                             :username => "cn=manager, dc=pgn-solution, dc=co, dc=id",
                             :password => "4lh4mdul1ll4h"
                           }
      filter = Net::LDAP::Filter.eq("cn", "#{params[:username]}")
      treebase = "dc=pgn-solution, dc=co, dc=id"
      ldap.search(:base => treebase, :filter => filter) do |entry|
        @email = entry["mail"].map(&:inspect).join(', ').gsub('"', '')
        @password = entry["userpassword"].map(&:inspect).join(', ').gsub('"', '')
        # if current_user.username == entry["sn"].map(&:inspect).join(', ').gsub('"', '')
        #   login_activity current_user.name + " has been logout "
        # end
      end
      @user.email = "#{@email}"
      @user.password = "#{@password}"
      @user.name = params[:user][:name]
      @user.user_type = params[:user][:user_type]
      @user.division_id = params[:user][:division_id]
      @user.role_ids = params[:user][:role_ids]
      @user.confirm = true
      @user.save!
      if @user.save!
        bypass_sign_in current_user
        redirect_to users_path, notice: 'User berhasil dibuat'
      else
        bypass_sign_in current_user
        redirect_to users_path, alert: 'User gagal dibuat'
      end
        else
          @user = User.new(user_params)

          respond_to do |format|
            if @user.save
              @user.update_columns(confirm: true)
              bypass_sign_in current_user
              format.html { redirect_to users_path, notice: 'User berhasil dibuat' }
              format.json { render :index, status: :created, location: @user }
            else
              format.html { render :new }
              format.json { render json: @user.errors, status: :unprocessable_entity }
            end
          end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    meth = params[:user][:password].blank? ? "update_without_password" : "update"

    respond_to do |format|
      if @user.send(meth, user_params)

        @user.update_columns(confirm: true)
        bypass_sign_in current_user
        format.html { redirect_to users_path, notice: 'User was successfully updated.' }
        format.json { render :index, status: :created, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])

    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :confirm, :username, :email, :password, :user_type, :division_id, :state,
                                 role_ids: [])
  end

end
