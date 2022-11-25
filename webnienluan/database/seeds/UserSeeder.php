<?php

use Illuminate\Database\Seeder;
use App\Admin;
use App\Roles;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Admin::truncate();
        DB::table('admin_roles')->truncate();
        
        $adminRoles = Roles::where('name','admin')->first();
        $authorRoles = Roles::where('name','author')->first();
        $userRoles = Roles::where('name','user')->first();

        $admin = Admin::create([
            'admin_name' => 'Admin',
            'admin_email' => 'admin@gmail.com',
            'admin_phone' => '0123456789',
            'admin_password' => md5('123456')
        ]);
        $author = Admin::create([
            'admin_name' => 'Author',
            'admin_email' => 'author@gmail.com',
            'admin_phone' => '0123456789',
            'admin_password' => md5('123456')
        ]);
        $user = Admin::create([
            'admin_name' => 'User',
            'admin_email' => 'user@gmail.com',
            'admin_phone' => '0123456789',
            'admin_password' => md5('123456')
        ]);

        $admin->roles()->attach($adminRoles);
        $author->roles()->attach($authorRoles);
        $user->roles()->attach($userRoles);
    }
}
