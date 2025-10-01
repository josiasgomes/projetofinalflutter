import 'package:flutter/material.dart';
import 'package:myapp/src/view/relatorios/full_screen_relatorios.dart';
import 'package:myapp/widget/app_bar.dart';
import 'package:myapp/widget/barra_navegacao_principal.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// Modelo de dados para os gráficos
class _ChartData {
  _ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}

class RelatoriosScreen extends StatelessWidget {
  const RelatoriosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Relatorios',
        automaticallyImplyLeading: true, // No back button on this screen
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Card com dados em texto
              Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mês Atual:',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      _buildReportItem(context, 'Total de projetos: 100'),
                      _buildReportItem(context, 'Projetos aprovados: 50'),
                      _buildReportItem(context, 'Projetos pendentes: 30'),
                      _buildReportItem(context, 'Projetos cancelados: 20'),
                      const SizedBox(height: 20),
                      const Divider(),
                      const SizedBox(height: 20),
                      _buildReportItem(context, 'Valor total aprovado: R\$ 5.000,00'),
                      _buildReportItem(context, 'Valores pendentes: R\$ 1.500,00'),
                      _buildReportItem(context, 'Valor total estimado: R\$ 6.500,00'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Card com os gráficos
              Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Análise Gráfica:',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        childAspectRatio: 1.0,
                        children: [
                          _buildClickableChartCard(context, 'Status', 0),
                          _buildClickableChartCard(context, 'Canais', 1),
                          _buildClickableChartCard(context, 'Assuntos', 2),
                          _buildClickableChartCard(context, 'Tipos', 3),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BarraNavegacaoPrincipal()
    );
  }





















  Widget _buildReportItem(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          const Icon(Icons.circle, size: 8, color: Colors.grey),
          const SizedBox(width: 10),
          Text(text, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }

  Widget _buildClickableChartCard(BuildContext context, String title, int chartIndex) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FullScreenChartScreen(
              title: title,
              chart: _buildSyncfusionChart(chartIndex, isFullScreen: true),
            ),
          ),
        );
      },
      child: Column(
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          // Exibe o gráfico em modo normal (pequeno e sem interatividade)
          Expanded(child: _buildSyncfusionChart(chartIndex, isFullScreen: false)),
        ],
      ),
    );
  }

  // Constrói o gráfico da Syncfusion
  Widget _buildSyncfusionChart(int chartIndex, {required bool isFullScreen}) {
    // Define os dados para cada gráfico
    final List<List<_ChartData>> allChartData = [
      // 0: Status
      [
        _ChartData('Aprov.', 50, Colors.green),
        _ChartData('Pend.', 30, Colors.orange),
        _ChartData('Canc.', 20, Colors.red),
      ],
      // 1: Canais
      [
        _ChartData('Web', 40, Colors.blue),
        _ChartData('App', 25, Colors.lightBlue),
        _ChartData('E-mail', 20, Colors.orange),
        _ChartData('Tel', 15, Colors.amber),
      ],
      // 2: Assuntos
      [
        _ChartData('Téc.', 60, Colors.teal),
        _ChartData('Com.', 25, Colors.cyan),
        _ChartData('Leg.', 15, Colors.lightGreen),
      ],
      // 3: Tipos
      [
        _ChartData('Venda', 45, Colors.purple),
        _ChartData('Sup.', 35, Colors.deepPurple),
        _ChartData('Info', 20, Colors.indigo),
      ],
    ];

   return SfCartesianChart(
      // Esconde os eixos na visualização pequena para um look mais limpo
      primaryXAxis: CategoryAxis(isVisible: isFullScreen),
      primaryYAxis: NumericAxis(isVisible: isFullScreen, maximum: 100),
      // Ativa o tooltip (dica ao tocar) apenas em tela cheia
      tooltipBehavior: TooltipBehavior(enable: isFullScreen),
      series: <CartesianSeries<_ChartData, String>>[
        ColumnSeries<_ChartData, String>(
          dataSource: allChartData[chartIndex],
          xValueMapper: (_ChartData data, _) => data.x,
          yValueMapper: (_ChartData data, _) => data.y,
          // Usa o mapeador de cores para pintar cada barra
          pointColorMapper: (_ChartData data, _) => data.color,
          // Habilita a legenda de dados (data label)
          dataLabelSettings: DataLabelSettings(
            isVisible: isFullScreen,
            textStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)
          ),
          borderRadius: BorderRadius.circular(8),
        )
      ],
    );
  }
}