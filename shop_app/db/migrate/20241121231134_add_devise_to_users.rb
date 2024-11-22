# frozen_string_literal: true

class AddDeviseToUsers < ActiveRecord::Migration[7.1]
  def self.up
    change_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: "" unless column_exists?(:users, :email)
      t.string :encrypted_password, null: false, default: "" unless column_exists?(:users, :encrypted_password)

      ## Recoverable
      t.string   :reset_password_token unless column_exists?(:users, :reset_password_token)
      t.datetime :reset_password_sent_at unless column_exists?(:users, :reset_password_sent_at)

      ## Rememberable
      t.datetime :remember_created_at unless column_exists?(:users, :remember_created_at)

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false unless column_exists?(:users, :sign_in_count)
      # t.datetime :current_sign_in_at unless column_exists?(:users, :current_sign_in_at)
      # t.datetime :last_sign_in_at unless column_exists?(:users, :last_sign_in_at)
      # t.string   :current_sign_in_ip unless column_exists?(:users, :current_sign_in_ip)
      # t.string   :last_sign_in_ip unless column_exists?(:users, :last_sign_in_ip)

      ## Confirmable
      # t.string   :confirmation_token unless column_exists?(:users, :confirmation_token)
      # t.datetime :confirmed_at unless column_exists?(:users, :confirmed_at)
      # t.datetime :confirmation_sent_at unless column_exists?(:users, :confirmation_sent_at)
      # t.string   :unconfirmed_email unless column_exists?(:users, :unconfirmed_email) # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false unless column_exists?(:users, :failed_attempts) # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token unless column_exists?(:users, :unlock_token) # Only if unlock strategy is :email or :both
      # t.datetime :locked_at unless column_exists?(:users, :locked_at)
    end
  end

  def self.down
    change_table :users do |t|
      t.remove :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at
    end
  end
end