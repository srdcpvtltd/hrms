<?php

namespace Database\Seeders;

use App\Models\coreApp\Setting\Setting;
use Illuminate\Database\Seeder;

class SettingsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $array = [
            'company_name',
            'company_logo_backend',
            'company_logo_frontend',
            'company_icon',
            'android_url',
            'android_icon',
            'ios_url',
            'ios_icon',
            'language',
            'emailSettingsProvider',
            'emailSettings_from_name',
            'emailSettings_from_email',
            'site_under_maintenance',
            'company_description',
            'default_theme',
            'app_theme_1',
            'app_theme_2',
            'app_theme_3',
            'email',
            'phone',
            'address',
            'twitter_link',
            'linkedin_link',
            'facebook_link',
            'instagram_link',
            'dribbble_link',
            'behance_link',
            'pinterest_link',
            'contact_title',
            'contact_short_description',
        ];

        $values = [
            'HRM',
            'uploads/settings/logo/logo-white.png',
            'uploads/settings/logo/logo-black.png',
            'uploads/settings/logo/favicon.png',
            'https://play.google.com/store/apps/details?id=com.worx24hour.hrm',
            'assets/favicon.png',
            'https://apps.apple.com/us/app/24hourworx/id1620313188',
            'assets/favicon.png',
            'en',
            'smtp',
            'hrm@onest.com',
            'hrm@onest.com',
            '0',
            'Onest Tech believes in painting the perfect picture of your idea while maintaining industry standards.',
            'app_theme_1',
            'static/app-screen/screen-1.png',
            'static/app-screen/screen-2.png',
            'static/app-screen/screen-3.png',
            'info@onesttech.com',
            '+62 (0) 000 0000 00',
            'House #148, Road #13/B, Block-E, Banani, Dhaka, Bangladesh',
            'https://twitter.com',
            'https://linkedin.com',
            'https://facebook.com',
            'https://instagram.com',
            'https://dribbble.com',
            'https://behance.com',
            'https://pinterest.com',
            'Send A Message To Get Your Free Quote',
            'Lorem Ipsum Dolor Sit Amet Consectetur. Est Commodo Pharetra Ac Netus Enim A Eget. Tristique Malesuada Donec Condimentum Mi Quis Porttitor Non Vitae Ultrices.',
        ];

        if (!session()->has('input')) {
            $array[] = 'stripe_key';
            $array[] = 'stripe_secret';
            $array[] = 'is_recaptcha_enable';
            $array[] = 'recaptcha_sitekey';
            $array[] = 'recaptcha_secret';
            $array[] = 'is_whatsapp_chat_enable';
            $array[] = 'whatsapp_chat_number';
            $array[] = 'is_tawk_enable';
            $array[] = 'tawk_chat_widget_script';
            $array[] = 'meta_title';
            $array[] = 'meta_description';
            $array[] = 'meta_keywords';
            $array[] = 'meta_image';
            $array[] = 'is_demo_checkout';
            // payment types
            $array[] = 'is_payment_type_cash';
            $array[] = 'is_payment_type_cheque';
            $array[] = 'is_payment_type_bank_transfer';
            // payment types end
            $values[] = 'pk_test_51NaH9CAEFWsTKUlUhOrl8P1yBT5Yx8bOmFFRwRWz7JzmLnk1LxvfWmD49bl31KvRCL9jxLKeKexNCxIzEV0kPl4n00lvX1LLaS';
            $values[] = 'sk_test_51NaH9CAEFWsTKUlUAKFJVBaYapJZr9pHwS8X8eaXcqFDcZbqrUaoQQqKM3iSYuy8Rb6zdm5aXYNpKkuuR6298IrH00697HeaHt';
            $values[] = '0';
            $values[] = '6Lc9bg0pAAAAAKoWkSe7B-rNdpvVgpJVTsR9JekP';
            $values[] = '6Lc9bg0pAAAAABd90JQSSjznnCaHAt5X2ca35IzQ';
            $values[] = '1';
            $values[] = '01234567890';
            $values[] = '1';
            $values[] = '<script type="text/javascript">
            var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
            (function(){
            var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
            s1.async=true;
            s1.src="https://embed.tawk.to/6551ee59958be55aeaaf15d9/1hf40m3te";
            s1.charset="UTF-8";
            s1.setAttribute("crossorigin","*");
            s0.parentNode.insertBefore(s1,s0);
            })();
            </script>';
            $values[] = 'Onest HRM';
            $values[] = 'Onest HRM revolutionizes human resource management, offering a comprehensive solution for businesses. Streamline your HR processes, from recruitment to employee management, with advanced features and intuitive tools. Optimize workforce efficiency, enhance employee engagement, and stay compliant effortlessly. Explore the power of Onest HRM for a seamless and strategic approach to HR.';
            $values[] = 'HR management software, Human resource solution, Employee management tool, Workforce optimization, Employee engagement platform, Compliance management, HR software solution, Talent management system.';
            $values[] = '';
            $values[] = 1;
            // payment types value
            $values[] = 1;
            $values[] = 1;
            $values[] = 1;
            // payment types value end
        }
        foreach ($array as $key => $item) {
            Setting::firstOrCreate([
                'name' => $item,
                'value' => $values[$key],
                'context' => 'app',
                'company_id' => 1,
            ]);
            Setting::firstOrCreate([
                'name' => $item,
                'value' => $values[$key],
                'context' => 'app',
                'company_id' => 2,
            ]);
        }
    }
}
