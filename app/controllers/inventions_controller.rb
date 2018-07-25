class InventionsController < ApplicationController
  before_action :authenticate_user!, :except => [:show]

  def create
    @invention = Invention.new()
    @invention.user_id = current_user.id
    @invention.user_name = current_user.name
    @invention.user_email = current_user.email
    @invention.title = params[:title]
    @invention.description = params[:description]
    @invention.image_url = params[:image_url]
    @invention.display_name = params[:display_name]
    @invention.display_email = params[:display_email]
    @invention.save!
   
    if params[:bits_used_ids]
      params[:bits_used_ids].each do |bit|
        ib = InventionsBit.new()
        ib.bit_id = bit.to_i
        ib.invention_id = @invention.id
        ib.save!

        b = Bit.find(bit.to_i)
        b.increment(:times_used, 1)
        b.save!
      end
    end

    materials_used_names_array = params[:materials_used_names].split(' ')
    if materials_used_names_array
      materials_used_names_array.each do |material|
        if Material.where(name: material).count == 0
          m = Material.new(name: material)
        else
          m = Material.where(name: material).first
          m.increment(:times_used, 1)
        end
        m.save!

        im = InventionsMaterial.new
        im.material_id = m.id
        im.invention_id = @invention.id 
        im.save!
      end
    end


    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Invention was successfully created' }
      format.json { render json: { status: 1 } }
    end
  end
  
  def edit
    @invention = Invention.find(params[:id])
  end

  def new
    @invention = current_user.inventions.new
    @bits = Bit.all
  end

  def show
    @invention = Invention.find(params[:id])
    @materials = []
    InventionsMaterial.where(invention_id: @invention.id).each do |r|
      @materials << r.material.name
    end
    @bits = []
    InventionsBit.where(invention_id: @invention.id).each do |r|
      @bits << r.bit.name 
    end
  end
end
