module Releasable
  class ReleasesController < ApplicationController
    def index
      @releases = Releasable::Release.all
    end

    def new
      @release = Release.new
    end

    def edit
      @release = retrieve_release
    end

    def create
      @release = Releasable.new(release_params)

      if @release.save
        redirect_to releases_path, notice: "Release #{@release.key} has been created"
      else
        render :new
      end
    end

    def update
      @release = retrieve_release

      if @release.update(release_params)
        redirect_to releases_path, notice: "Release #{@release.key} has been updated"
      else
        render :edit
      end
    end

    def destroy
      @release = retrieve_release
      @release.destroy

      redirect_to releases_path, notice: "Release #{@release.key} has been deleted"
    end

    private

    def retrieve_release
      @release = Releasable.find(params[:id])
    end

    def release_params
      params.require(:release).permit(:user_ids, :active)
    end
  end
end
