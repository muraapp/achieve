require 'rails_helper'

describe Contact do
  # 名前とメールアドレスと内容があれば有効な状態であること
  it "is valid with name and email and content" do
    contact = Contact.new(name: 'sample' ,email: 'sample@sample.com', content: '暑いです')
    expect(contact).to be_valid
  end

  # 名前がなければ無効であること
  it "is invalid without a name" do
    contact = Contact.new
    expect(contact).not_to be_valid
  end

  it "is invalid without a name" do
    contact = Contact.new
    contact.valid?
    expect(contact.errors[:name]).to include("を入力してください")
  end

  # メールアドレスがなければ無効であること
  it "is invalid without a email" do
    contact = Contact.new
    expect(contact).not_to be_valid
  end

  it "is invalid without a email" do
    contact = Contact.new
    contact.valid?
    expect(contact.errors[:email]).to include("を入力してください")
  end

  # 内容がなければ無効であること
  it "is invalid without a content" do
    contact = Contact.new
    expect(contact).not_to be_valid
  end

  it "is invalid without a content" do
    contact = Contact.new
    contact.valid?
    expect(contact.errors[:content]).to include("を入力してください")
  end

  # 名前はあるが、メールアドレスか内容がない場合は無効
  context "is valid with a name" do
    it "is invalid without email or content" do
      contact = Contact.new(name: "sample")
      expect(contact).not_to be_valid
    end
  end

  context "is valid with name" do
    it "is invalid without email or content" do
      contact = Contact.new(name: "sample")
      contact.valid?
      expect(contact.errors[:email]).to include("を入力してください")
    end
  end

  # メールアドレスはあるが、名前か内容がない場合は無効
  context "is valid with email" do
    it "is invalid without name or content" do
      contact = Contact.new(email: "sample@sample.com")
      expect(contact).not_to be_valid
    end
  end

  context "is valid with email" do
    it "is invalid without name or content" do
      contact = Contact.new(email: "sample@sample.com")
      contact.valid?
      expect(contact.errors[:name]).to include("を入力してください")
      expect(contact.errors[:content]).to include("を入力してください")
    end
  end

  # 内容はあるが、名前かメールアドレスがない場合は無効
  context "is valid with content" do
    it "is invalid without name or email" do
      contact = Contact.new(content: "暑いです")
      expect(contact).not_to be_valid
    end
  end

  context "is valid with content" do
    it "is invalid without name or email" do
      contact = Contact.new(content: "暑いです")
      contact.valid?
      expect(contact.errors[:name]).to include("を入力してください")
      expect(contact.errors[:email]).to include("を入力してください")
    end
  end

  # 名前とメールアドレスはあるが、内容がない場合は無効
  context "is valid with a name and email" do
    it "is invalid without content" do
      contact = Contact.new(name: "sample", email: "sample@sample.com")
      expect(contact).not_to be_valid
    end
  end

  context "is valid with a name and email" do
    it "is invalid without content" do
      contact = Contact.new(name: "sample", email: "sample@sample.com")
      contact.valid?
      expect(contact.errors[:content]).to include("を入力してください")
    end
  end

  # 名前と内容はあるが、メールアドレスがない場合は無効
  context "is valid with a name and content" do
    it "is invalid without email" do
      contact = Contact.new(name: "sample", content: "暑いです")
      expect(contact).not_to be_valid
    end
  end

  context "is valid with a name and email" do
    it "is invalid without content" do
      contact = Contact.new(name: "sample", content: "暑いです")
      contact.valid?
      expect(contact.errors[:email]).to include("を入力してください")
    end
  end

  # メールアドレスと内容はあるが、名前がない場合は無効
  context "is valid with email and content" do
    it "is invalid without name" do
      contact = Contact.new(email: "sample@sample.com", content: "暑いです")
      expect(contact).not_to be_valid
    end
  end

  context "is valid with email and content" do
    it "is invalid without name" do
      contact = Contact.new(email: "sample@sample.com", content: "暑いです")
      contact.valid?
      expect(contact.errors[:name]).to include("を入力してください")
    end
  end




end
