<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('regularizations', function (Blueprint $table) {
            $table->unsignedBigInteger('manager_id')->after('user_id')->nullable();

            $table->foreign('manager_id')
            ->references('manager_id')
            ->on('users')
            ->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('regularizations', function (Blueprint $table) {
            $table->dropColumn('manager_id');
        });
    }
};
