# spec/support/shared_api_contexts.rb
  shared_context 'a crud index' do
    before do
      FactoryGirl.create_list(model, 3)
      @instances = klass.all
      get :index
      assert_response :success
    end
    
    it "should return all instances" do
      expect(assigns[:objects]).to eq(@instances)
    end
  end

  shared_context 'a crud new' do
    it "should have blank instance" do
      expect(klass).to receive(:new).and_call_original
      get :new
    end
  end

  shared_context 'a crud create' do
    before do 
      @params = FactoryGirl.attributes_for :event
    end

    it "should create the object" do 
      expect(klass).to receive(:create).and_return(:true)
      post :create, params: { model => @params}
    end
  end

  shared_context 'a crud show' do
    before do 

      @instance = FactoryGirl.create model
      get :show, params: { id: @instance.id }
      assert_response :success
    end

    it "should return the seeked object" do
      expect(assigns[:object]).to eq(@instance)
    end
  end

  shared_context 'a crud edit' do
    before do 
      @instance = FactoryGirl.create model
      get :edit, params: { id: @instance.id }
      assert_response :success
    end

    it "should return the seeked object" do
      expect(assigns[:object]).to eq(@instance)
    end   
  end
  
  shared_context 'a crud update' do 
    before do 
      @instance = FactoryGirl.create model
      @updates = FactoryGirl.attributes_for model
      patch :update, params: { id: @instance.id, model => @updates }
      @instance.reload
    end

    it "should update the object" do
      matching = @instance.attributes.transform_keys {|x| x.to_sym}.to_a & 
                 @updates.to_a
      expect(matching).to eq(@updates.to_a)
    end
  end

  shared_context 'a crud destroy' do 
    before do 
      @instance = FactoryGirl.create model
      delete :destroy, params: { id: @instance.id }
    end

    it "should destroy the object" do
      expect(klass.exists? @instance).to be(false)
    end
  end