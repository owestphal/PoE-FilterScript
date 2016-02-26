#include "mainwindow.hpp"
#include "ui_mainwindow.h"

#include "QFileDialog"
#include "QDir"
#include "QProcess"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_toolButton_clicked()
{
    QString fileName = QFileDialog::getOpenFileName(this,
        tr("Choose Sourcefile"), QDir::homePath(), tr("FilterScript (*.fs)"));
    ui->lineEdit->insert(fileName);
}

void MainWindow::on_pushButton_clicked()
{
    QProcess *compilation = new QProcess(this);
    QString sourceFile;
    sourceFile = ui->lineEdit->text();
    ui->textEdit->append(tr("Compiling ") + sourceFile);
    compilation->start(tr("flc"), QStringList(sourceFile));

}
