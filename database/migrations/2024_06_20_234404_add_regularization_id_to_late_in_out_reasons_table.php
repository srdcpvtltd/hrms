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
        Schema::table('late_in_out_reasons', function (Blueprint $table) {
            $table->unsignedBigInteger('regularization_id')->after('attendance_id')->nullable();

            $table->foreign('regularization_id')
            ->references('id')
            ->on('regularizations')
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
        Schema::table('late_in_out_reasons', function (Blueprint $table) {
            // Drop the foreign key constraint
            $table->dropForeign(['regularization_id']);

            // Drop the column
            $table->dropColumn('regularization_id');
        });
    }
};
