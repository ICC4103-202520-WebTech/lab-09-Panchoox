class MigrateRoleToInteger < ActiveRecord::Migration[8.0]
  disable_ddl_transaction! if respond_to?(:disable_ddl_transaction!)

  def up
    # 1) añadir columna temporal integer
    add_column :users, :role_tmp, :integer, default: 0, null: false

    # 2) respaldar y mapear valores existentes usando SQL (más seguro que iterar con el modelo)
    execute <<-SQL.squish
      UPDATE users
      SET role_tmp = CASE
        WHEN trim(lower(coalesce(role, ''))) = 'admin' THEN 1
        WHEN trim(lower(coalesce(role, ''))) = 'regular' THEN 0
        WHEN coalesce(role, '') ~ '^[0-9]+$' THEN CAST(role AS integer)
        ELSE 0
      END
    SQL

    # 3) eliminar la columna vieja y renombrar
    remove_column :users, :role
    rename_column :users, :role_tmp, :role

    # 4) asegurar constraints
    change_column_default :users, :role, 0
    change_column_null :users, :role, false
  end

  def down
    # Revertir: crear columna string y volcar enteros como strings
    add_column :users, :role_old, :string

    execute <<-SQL.squish
      UPDATE users
      SET role_old = CASE
        WHEN role = 1 THEN 'admin'
        WHEN role = 0 THEN 'regular'
        ELSE role::text
      END
    SQL

    remove_column :users, :role
    rename_column :users, :role_old, :role
  end
end