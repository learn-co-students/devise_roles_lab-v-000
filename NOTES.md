to set default value you could also add the following to the user model:
```
after_initialize :set_default_user_role

def set_default_user_role
  self.role ||= :user
end
OR

def self.new_admin
  self.new.tap do |u|
    u.role = :admin
  end
end

def self.new_vip
  self.new.tap do |u|
    u.role = :vip
  end
end
```


# can't mess with initialize method directly, so need to use after_initialize
